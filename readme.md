kubectl create serviceaccount test-admin

kubectl create clusterrolebinding test-admin-sa-binding --clusterrole=cluster-admin --serviceaccount=default:test-admin
clusterrolebinding.rbac.authorization.k8s.io/test-admin-sa-binding created