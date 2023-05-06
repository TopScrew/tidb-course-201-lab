aws cloudformation create-stack \
  --stack-name quick-demo-002 \
  --on-failure DO_NOTHING \
  --template-body file://_quick-demo-pe-cloud-formation.json \
  --region us-west-2 \
  --parameters "ParameterKey=TrainerName,ParameterValue=${1}" "ParameterKey=TrainerEmail,ParameterValue=${2}"
