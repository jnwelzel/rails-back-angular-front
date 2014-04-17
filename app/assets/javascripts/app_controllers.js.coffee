@app.controller 'HomeCtrl', ['$scope', ($scope) ->
  $scope.msg = 'Scope says hello'
]

@app.controller 'AllPostsCtrl', ['$scope', 'Post', ($scope, Post) ->
  $scope.posts = Post.query()
]

@app.controller 'NewPostCtrl', ['$scope', '$location', 'Post', ($scope, $location, Post) ->
  $scope.post = {}

  $scope.create = (post) ->
    # new Post(angular.copy(post)).$save()
    res = Post.save(angular.copy(post))
    res.then (result) ->
      $location.path '/posts' if res?

    return
  return
]