@app.controller 'HomeCtrl', ['$scope', ($scope) ->
  $scope.msg = 'Scope says hello'
]

@app.controller 'AllPostsCtrl', ['$scope', 'Post', ($scope, Post) ->
  $scope.posts = Post.all()
]

@app.controller 'NewPostCtrl', ['$scope', '$location', 'Post', ($scope, $location, Post) ->
  $scope.post = {}

  $scope.create = (post) ->
    res = Post.save(angular.copy(post))
    res.then (result) ->
      $location.path '/posts' if res?
    return
  return
]

@app.controller 'ShowPostCtrl', ['$scope', 'Post', '$routeParams', 'Comment', ($scope, Post, $routeParams, Comment) ->
  $scope.post = Post.find($routeParams['id'])
  $scope.comment = {}
  $scope.comments = Comment.all($routeParams['id'])
  $scope.createComment = (comment) ->
    comment.post_id = $routeParams['id']
    Comment.create(comment)
  return
]