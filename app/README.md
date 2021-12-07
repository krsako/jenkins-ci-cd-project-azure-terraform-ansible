### App Deploy

Deploy ingress on test environment using helm:

helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx --kubeconfig config-quiz-test  
helm repo update --kubeconfig config-quiz-test  
helm install ingress-nginx ingress-nginx/ingress-nginx --kubeconfig config-quiz-test

Deploy of application on kubernetes cluster on test environment:

kubectl apply -f app/frontend.yml --namespace quiz --kubeconfig config-quiz-test  
kubectl apply -f app/backend.yml --namespace quiz --kubeconfig config-quiz-test  
kubectl apply -f app/ingress.yml --namespace quiz --kubeconfig config-quiz-test
