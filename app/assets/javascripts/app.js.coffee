@app = angular.module('app', ['ngResource', 'ngRoute'])

@app.config ['$routeProvider', ($routeProvider) ->
  $routeProvider
    .when '/posts', {templateUrl: 'partials/posts/index.html', controller: 'AllPostsCtrl'}
    .when '/new_post', {templateUrl: 'partials/posts/new.html', controller: 'NewPostCtrl'}
    .otherwise {templateUrl: 'home.html', controller: 'HomeCtrl'}
]

@app.config ['$httpProvider', ($httpProvider) ->
  authToken = $('meta[name=\'csrf-token\']').attr('content')
  $httpProvider.defaults.headers.common['X-CSRF-TOKEN'] = authToken
  $httpProvider.interceptors.push('httpInterceptor');
]

