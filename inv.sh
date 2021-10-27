>inv.txt
for component in frontend-env catalogue-env cart-env user-env shipping-env payment-env mysql-env mongo-env redis-env rabbitmq-env; do
  IP=$(aws ec2 describe-instances --filters Name=tag:Name,Values=${component} Name=instance-state-name,Values=running | jq '.Reservations[].Instances[].PrivateIpAddress' |xargs)
  if [ -n "${IP}" ]; then
    echo $IP component=${component} ansible_user=root ansible_password=DevOps321 >>inv.txt
  fi
done