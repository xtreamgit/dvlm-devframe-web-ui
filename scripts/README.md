# DADF Repository Management Scripts

This directory contains automation scripts for managing the Develom AI Development Framework repositories.

## Scripts

### Daily Summary Generator

**Purpose**: Automatically generates daily summaries of repository activities.

#### Files

- **`generate-daily-summary.sh`** - Main script that generates daily summaries
- **`install-daily-cron.sh`** - Installation script for automatic daily execution
- **`daily-summary/`** - Directory containing generated summary files

#### Installation

```bash
cd /Users/hector/github.com/xtreamgit/dvlm-devframe-web-ui/scripts
./install-daily-cron.sh
```

This will:
- Make the summary script executable
- Set up automatic execution at 8:00 AM daily (using launchd on macOS, cron on Linux)
- Generate an initial summary

#### Manual Execution

To manually generate a summary:

```bash
./generate-daily-summary.sh
```

The summary will be created at `daily-summary/daily-summary-YYYY-MM-DD.md`

#### Summary Contents

Each daily summary includes:

- **Repository Status**: Branch information, uncommitted changes
- **Commits**: All commits made today across all repos
- **Changes**: File statistics and modifications
- **Tasks**: Tasks created, fixes applied, corrections made
- **Notes**: Important notes and observations
- **Next Steps**: Recommended actions
- **Health Check**: Status of all repositories

#### Scheduling

**macOS (launchd)**:
- Configured via: `~/Library/LaunchAgents/com.dadf.dailysummary.plist`
- Check status: `launchctl list | grep dailysummary`
- Uninstall: `launchctl unload ~/Library/LaunchAgents/com.dadf.dailysummary.plist`

**Linux (cron)**:
- View cron jobs: `crontab -l`
- Edit cron jobs: `crontab -e`
- Uninstall: Remove the line containing `generate-daily-summary.sh`

#### Customization

To customize the summary generation:

1. Edit `generate-daily-summary.sh`
2. Modify the `REPOS` array to add/remove repositories
3. Adjust the sections in the summary template
4. Change the schedule in `install-daily-cron.sh` (default: 8:00 AM)

#### Logs

Execution logs are stored in:
- `daily-summary/cron.log` - Standard output
- `daily-summary/cron.error.log` - Error output

## Future Scripts

Additional scripts to be added:

- **Repository health check** - Comprehensive health status across all repos
- **Dependency updater** - Check and update dependencies
- **Release automation** - Automate release processes
- **Backup script** - Automated backups of repositories
- **Status dashboard** - Generate HTML dashboard of repo status

## Contributing

To add new scripts:

1. Create the script file in this directory
2. Make it executable: `chmod +x script-name.sh`
3. Add documentation to this README
4. Test thoroughly before committing
5. Update CHANGELOG in relevant repositories

## Notes

- All scripts assume they're running from `/Users/hector/github.com/xtreamgit/dvlm-devframe-web-ui/scripts`
- Scripts use relative paths to locate repositories in the grandparent directory
- Ensure Git is properly configured before running
- Scripts are safe to run multiple times (idempotent)
