@app.factory 'Post', ['$resource', ($resource) ->
  PostResource = $resource('/api/posts/:id', {id: '@id'})

  save: (post) ->
    response = new PostResource(post).$save()
    response.then (result) ->
      result

  all: ->
    PostResource.query()

  find: (id) ->
    PostResource.get({id: id})
]

@app.factory 'Comment', ['$resource', ($resource) ->
  CommentResource = $resource('/api/posts/:postId/comments/:commentId', {postId: @post_id, commentId: @id})

  all: (postId) ->
    CommentResource.get({postId: postId})

  create: (comment) ->
    response = new CommentResource(comment).$save()
]

@app.factory 'httpInterceptor', ['$q', ($q) ->
  {
    'responseError': (rejection) ->
      # handle error
      msg = '(' + rejection.status + ' ' + rejection.statusText + ')'
      angular.element(showMessage('Something went wrong ' + msg, 'error'))
      $q.reject rejection
  }
]