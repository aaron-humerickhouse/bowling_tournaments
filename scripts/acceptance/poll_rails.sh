export ACCEPTANCE_RAILS_PORT=5017

for i in `seq 1 30`;
do
  nc -z localhost $ACCEPTANCE_RAILS_PORT && echo Success && exit 0
  echo Polling for rails
  sleep 2
done
echo Failed waiting for Rails && exit 1
