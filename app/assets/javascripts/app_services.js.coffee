@app.factory 'Post', ['$resource', ($resource) ->
  PostResource = $resource('/api/posts/:id', {id: '@id'})

  save: (post) ->
    response = new PostResource(post).$save()
    response.then (result) ->
      result
]

@app.factory 'httpInterceptor', ['$q', 'flash', ($q, flash) ->
  {
    'responseError': (rejection) ->
      # handle error
      showMessage('Something went wrong...', 'error')
      $q.reject rejection
  }
]