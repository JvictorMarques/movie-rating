# Changelog

## [0.2.0](https://github.com/JvictorMarques/movie_rating/compare/chart/v0.1.0...chart/v0.2.0) (2026-05-30)


### Features

* add movie-rating Helm chart and configuration files for ArgoCD deployment ([9feef5b](https://github.com/JvictorMarques/movie_rating/commit/9feef5bea694897ec1ce2bb99cde5eda10819535))
* **app:** verify release-please setup ([cc7bbbf](https://github.com/JvictorMarques/movie_rating/commit/cc7bbbf4263ff43b0e87c8bb47695f72ed52dcc8))
* **k8s:** add ArgoCD application for movie-rating ([570de40](https://github.com/JvictorMarques/movie_rating/commit/570de4097911c3fe53f3fa7b689f7242f7d9f7fc))


### Bug Fixes

* add sync-wave annotations for ExternalSecrets and SecretStore ([90eaf05](https://github.com/JvictorMarques/movie_rating/commit/90eaf058ebab49b64044103f6b9da3ad8e3f505b))
* **k8s:** move ENVIRONMENT var out of ExternalSecret template ([66bd7e4](https://github.com/JvictorMarques/movie_rating/commit/66bd7e46d356de3847ff9872521b5d34758c9f15))
* **k8s:** update annotations for ArgoCD sync-wave and hook policies in app and migrations templates ([bd6da23](https://github.com/JvictorMarques/movie_rating/commit/bd6da2330a68bff509e100fc8b5dc3b20925b41a))
* **k8s:** wrap annotations in Service metadata for proper formatting ([9f6f9ae](https://github.com/JvictorMarques/movie_rating/commit/9f6f9aec85536b5c719212e63e633fc7bdf75ec8))
* update apiVersion for ExternalSecret from v1beta1 to v1 in app and migrations templates ([9b8b0ea](https://github.com/JvictorMarques/movie_rating/commit/9b8b0eac1d07f4a8c81371ba97a82856b85cc05b))
* update CPU limit for app resources ([e2f7d9f](https://github.com/JvictorMarques/movie_rating/commit/e2f7d9f133be6ef7e5ea41ae9054dd44ad05838d))
* update Ingress rules to conditionally include host configuration ([be7f9e2](https://github.com/JvictorMarques/movie_rating/commit/be7f9e234564ffb83fdd1a914bb3e734a9467656))
* **values.yaml:** increase CPU and memory limits for migrations job ([6da755f](https://github.com/JvictorMarques/movie_rating/commit/6da755f71897bea84c877f0409251082350ad513))
* **values.yaml:** increase CPU limits for app and migrations to improve performance ([8066de6](https://github.com/JvictorMarques/movie_rating/commit/8066de6b1be93ce15d7bf1c8c31021950dc984c8))
