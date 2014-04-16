@app.controller 'HomeCtrl', ['$scope', ($scope) ->
  $scope.msg = 'Scope says hello'
]

@app.controller 'AllPostsCtrl', ['$scope', 'Post', ($scope, Post) ->
  $scope.posts = Post.query()
]

@app.controller 'NewPostCtrl', ['$scope', '$location', 'Post', ($scope, $location, Post) ->
  $scope.post = {}
  @error = []
  @success = []

  $scope.create = (post) =>
    new Post(angular.copy(post)).$save({}, success_callback(@success), error_callback(@error))
    return
  return

  success_callback: (success) ->
    console.log "save post SUCCESS: #{@success}"
    $location.path '/posts'
    return

  error_callback: (error) ->
    console.log "save post ERROR: #{@error}"
    return
]