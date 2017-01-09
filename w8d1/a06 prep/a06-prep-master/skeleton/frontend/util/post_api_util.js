export const fetchPosts = () => (
  $.ajax({
    url: 'api/posts',
    method: 'GET'
  })
)

export const fetchPost = id => (
  $.ajax({
    url: `api/posts/${id}`,
    method: 'GET'
  })
)

export const createPost = post => (
  $.ajax({
    url: 'api/posts',
    data: {post},
    method: 'POST'
  })
)

export const updatePost = post => (
  $.ajax({
    url: `api/posts/${post.id}`,
    data: {post},
    method: 'PATCH'
  })
)

export const deletePost = id => (
  $.ajax({
    url: `api/posts/${id}`,
    method: 'DELETE'
  })
)
