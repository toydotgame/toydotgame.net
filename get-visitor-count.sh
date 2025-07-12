#!/bin/bash
#############################################################################################
#### AUTHOR: toydotgame                                                                     #
#### CREATED ON: 2025-07-12                                                                 #
#### Passes a GraphQL query as a JSON object, as per                                        #
#### developers.cloudflare.com/analytics/graphql-api/getting-started/execute-graphql-query/ #
#### and parses its JSON response to yield a valid object. Writes that data to a local      #
#### file. Requires the following environment variables:                                    #
#### SECRETS: (Keep super safe and hidden!)                                                 #
#### - CLOUDFLARE_API_TOKEN: Token with Zone:Analytics:Read and Site:<site that owns the    #
####   zone $ZONE_TAG> permissions                                                          #
#### VARIABLES: (Can be stored in plaintext)                                                #
#### - ZONE_TAG: Zone ID available in CloudFlare dash for desired site                      #
#############################################################################################

# For toydotgame.net, it should be noted that the previous visitor counter
# system had tracked ≥ 3,900 page visits: (This value will be used to initialise
# ./visitor-count)
# https://web.archive.org/web/20250117032938im_/https://www.free-website-hit-counter.com/c.php?d=6&id=160327&s=5

START_DATE="$(date +'%Y-%m-%d' -d '2 days ago')" # The day before yesterday (yyyy-mm-dd)
END_DATE="$(date +'%Y-%m-%d' -d '1 day ago')"    # Yesterday (yyyy-mm-dd)

echo '{
	"query": "{
		viewer {
			zones(filter: { zoneTag: $zone }) {
				httpRequests1dGroups(
					filter: {
						date_gt: $start,
						date_leq: $end
					},
					limit: 1
				) {
					uniq {
						uniques
					}
				}
			}
		}
	}",
	"variables": {
		"zone": "'$ZONE_TAG'",
		"start": "'$START_DATE'",
		"end": "'$END_DATE'"
	}
}' | tr -d "\n\t" | curl -s \
	https://api.cloudflare.com/client/v4/graphql \
	-H "Authorization: Bearer "$CLOUDFLARE_API_TOKEN \
	-H "Content-Type: application/json" \
	-d @- \
| jq ".data.viewer.zones.[].httpRequests1dGroups.[].uniq.uniques" \
> .tmp
# Write to a temp file without needing to deal with shell-specific handling of
# things like pipes and exit codes. This file will be empty if jq(1) fails, or
# will contain the visitor count if it succeeds. stderr is not handled, so will
# appear in the terminal. That's okay.

if [ "$?" != "0" ]; then
	echo "Finding the visitor count failed! Exiting..." >&2
	exit
fi

PREVIOUS_VISITOR_COUNT=$(head -1 visitor-count)
NEXT_VISITOR_COUNT=$(head -1 .tmp)
TOTAL_VISITORS=$((PREVIOUS_VISITOR_COUNT+NEXT_VISITOR_COUNT)) # _Can_ handle null operands (assumes 0)
echo "Total visitor count updated:"
echo -e "\tWas: "$PREVIOUS_VISITOR_COUNT
echo -e "\tNew visitors: "$NEXT_VISITOR_COUNT
echo -e "\tNow: "$TOTAL_VISITORS

#echo $TOTAL_VISITORS > visitor-count
rm -f .tmp
