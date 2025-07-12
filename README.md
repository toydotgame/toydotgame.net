# get-visitor-count
`get-visitor-count` is my first GitHub Actions workflow. It fetches the most recent full day of data (yesterday) from CloudFlare, requesting the `httpRequests1dGroups()` dataset. Within that dataset, it requests `uniq.uniques` (actual value in the CloudFlare API data type documentation is `ZoneHttpRequests1dGroupsUniq.uniques`). This number is the number of unique IPs that have visited your site. CloudFlare reports that as the _Total Unique Visitors_ field as seen in the CloudFlare dashboard for your desired site, _Analytics & Logs_ → _HTTP Traffic_:
<img width="916" height="308" alt="Web Traffic section of the Cloudflare DNS analytics screen" src="https://github.com/user-attachments/assets/a4d50f4c-f04c-4d80-8e22-97cd1f58fa5b" />

This telemetry is done at the DNS level, provided you:
1. Have your site(s) for a certain domain (a CloudFlare "site") that use CloudFlare for their DNS records (e.g. for GitHub pages that's 4 A records and a CNAME for your domain pointing to the GitHub Pages server)
2. Have your aforementioned A records for your site proxied through CloudFlare

> [!NOTE]
> If you have your SSL encryption mode set to _Flexible_ for your proxied site in question, you may get a failure to resolve and browsers will indefinitely redirect improperly trying to fetch resources from your site. To fix this:
> 1. Go to your site's dash, _SSL/TLS_ → _Overview_ → _SSL/TLS Encryption_
> 2. Hit _Configure_
> 3. If, under _Select encryption mode_, you are using _Automatic SSL/TLS (default)_, select instead _Custom SSL/TLS_
> 4. Under _Custom SSL/TLS_, select _Full (Strict)_
> 5. Hit _Save_

Once you have a correctly-configured, proxied site using CloudFlare's DNS (which you may have already), you will begin getting analytics for site visitors (usually within 10–15 minutes but it can take longer).

## Setting up this Action
This action isn't designed to be a reusable one, so setup will be manual. (This is only designed for myself so if you find it cool, that's awesome!—but you've gotta put some work in)

Set up the following values, under repository _Settings_ → _Security_ → _Secrets and variables_ → _Actions_:
* _Secrets_ tab → _Repository secrets_ → _New repository secret_, name `CLOUDFLARE_API_TOKEN`. The value of this should be [an API token for your site](https://developers.cloudflare.com/fundamentals/api/get-started/create-token/) with the following things set:
	* **Permissions:** `Zone:Analytics:Read`
	* **Zone Resources:** `Site:<site domain in question>`. This one is optional, but is good practice to restrict the token to only the site(s) in CloudFlare you want. If you omit adding zone resources to the token, CloudFlare will let the token access all sites on your account
* _Variables_ tab → _Repository variables_ → _New repository variable_, name `ZONE_TAG`. The value of this should be the value of the _Zone ID_ in your site's CloudFlare dash, _Overview_ → _API_ (right-hand column)

Preferably (because this workflow runs daily), create an orphan branch with no history to store your work on:
```bash
git switch --orphan visitor-count
# Copy the files `.github/workflows/get-visitor-count.yml` and `get-visitor-count.sh` to your working directory, preserving structure
git add -A
git commit -m "Initial commit"
```

Replace `workflow_dispatch` with `push` on the following line:
https://github.com/toydotgame/toydotgame.github.io/blob/63521180bbcb1a920ac2662c441fbc177a7499c8/.github/workflows/get-visitor-count.yml#L6

Then push:
```bash
git push -u origin visitor-count
```

Then you can replace `push` back to `workflow_dispatch`, commit, and push again. We needed to set it to `push` once because—given we're on a non-main branch, the GitHub web UI won't let us run `workflow_dispatch` triggers. (This obviously doesn't apply to those who are adding this to their default branch)

Your workflow should be set up and the schedule (every day at midnight) should work! To run it manually, use the GitHub CLI:
```bash
gh workflow list # Optional, but lets you see the name of the workflow
gh workflow run <name> --ref visitor-count # Run on the `visitor-count` branch instead of default
```
