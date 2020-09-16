import consumer from "./consumer"

consumer.subscriptions.create("CommentChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },


  received(data) {
    console.log(data)
    // nickname: @comment.user.nickname,content: @comment
    const html = `<p>${data.nickname}:${data.content.text}</p>`;
    // html="入力した文字"
    const comments = document.getElementById('comments');
    const newComment = document.getElementById('comment_text');
    // afterbegin: 要素内部の先頭に挿入（要素id=messages） 
    comments.insertAdjacentHTML('afterbegin', html);
    newComment.value = '';
  }
});
