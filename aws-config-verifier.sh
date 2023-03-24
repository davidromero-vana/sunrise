IDENTITY=$(aws sts get-caller-identity)
if [ $(echo $IDENTITY | jq '.UserId' | grep -c $AWS_USER_NAME) -gt 0 ]; then
  echo "Valid Credentials"
  ACCOUNT_NUM=$(echo $IDENTITY | jq '.Account | tonumber')
  AWS_ENV=$(case $ACCOUNT_NUM in
  ($ACCOUNT_NUM_DEV) echo "DEV" ;;
  ($ACCOUNT_NUM_QA) echo "QA" ;;
  ($ACCOUNT_NUM_PROD) echo "PROD" ;;
  esac)
  echo $AWS_ENV" environment"
else
  echo "Invalid Credentials"
fi
