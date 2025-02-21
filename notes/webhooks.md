# now we need to make sure we get our jenkins job tiggered soon there is push in github, so we need to condifure webhooks.
- we need this plugin - Multibranch Scan Webhook TriggerVersion
- then go to multibranch job - 
  - scan multibranch pipeline triggers
  - scan by webhook 
  - trigger-token = dpp-token
    - if you hoover over the question mark - JENKINS_URL/multibranch-webhook-trigger/invoke?token=[Trigger token]
    - lets modify this - 52.23.128.92:8080/multibranch-webhook-trigger/invoke?token=dpp-token
    - github - repo - setting - webhook - add_webhook = http://52.23.128.92:8080/multibranch-webhook-trigger/invoke?token=dpp-token
    - webhook configured.
    