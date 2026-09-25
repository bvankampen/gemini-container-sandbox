Simple script to run gemini-cli in a container.

# First time run

Copy `env.example` to `.env` and set `GOOGLE_CLOUD_PROJECT`

Run inside container (start container with run.sh):

```bash
gcloud auth application-default login --project suse-gemini-code-assist 
gemini --skip-trust
```

