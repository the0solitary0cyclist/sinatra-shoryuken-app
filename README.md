Log into AWS
Set up and name queue

in theory, populate .env
```AWS_ACCESS_KEY_ID=''
AWS_SECRET_ACCESS_KEY=''
AWS_REGION=''
QUEUE_NAME=''```

`bundle`
`ruby generate_shoryuken_config.rb`

if it won't load, run in each server and worker tab:

```export AWS_REGION=''
export AWS_ACCESS_KEY_ID=''
export AWS_SECRET_ACCESS_KEY=''```

In one tab run:
`ruby app.rb`

In another tab, run:
`shoryuken -r ./workers/message_worker.rb -C shoryuken.yml`

Visit http://localhost:4567/

Input message and send
At first I put a delay put into the worker, you can poll for messages on AWS SQS and see the message in flight... but then it turns out it's even easier to just set the worker's auto_delete: false