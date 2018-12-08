# aws-cli-helpers
AWS cli helper scripts

All Bash unless indicated otherwise.

## Setup

Run [`./setup.sh`](./setup.sh) - _obviously this will only work in bash. This may or may not work in Git bash on windows!_

## Scripts

### AWS CLI scripts

#### awsprofile

Lets you list configured AWS CLI profiles or set the profile for your session.

#### awsprofile.bat [Windows CMD]

Lets you do the same on Windows. Add the path to your environment variables, then call it the same way as in bash, e.g. `awsprofile`

#### awswhoami

Simply tells you who you are!

### Okta + AWS CLI Scripts

#### awscli

Okta AWS CLI helper (basic, single Application) - based on https://github.com/oktadeveloper/okta-aws-cli-assume-role

*Further instructions to be added as well as a more complex script that lets you choose which Okta AWS application to use*

#### oktaclean

Remove local okta session files

#### oktasession

Display info about last okta session
