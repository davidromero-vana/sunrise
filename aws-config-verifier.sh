aws sts get-caller-identity | jq --arg AWS_USER_NAME "$AWS_USER_NAME" '.UserId | contains($AWS_USER_NAME)'
