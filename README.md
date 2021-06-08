# Simple Static Go Server + Docker Image Template

I use this whenever I need to quickly spin up a site with static web content. I use
[cert-manager](https://cert-manager.io) and [ingress-nginx](https://kubernetes.github.io/ingress-nginx/) on my kubernetes cluster, so I don't need to worry about certificates here.

The final container image is created from scratch, and contains exactly the contents
of `site` and the server binary which runs the following:

``` go
import "net/http"

func main() {
	http.Handle("/", http.FileServer(http.Dir("/site")))
	http.HandleFunc("/healthz", func(w http.ResponseWriter, r *http.Request) {
		w.WriteHeader(http.StatusOK)
	})

	http.ListenAndServe(":8080", nil)
}
```
