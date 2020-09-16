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
    const messages = document.getElementById('messages');
    const newMessage = document.getElementById('message_text');
    // afterbegin: 要素内部の先頭に挿入（要素id=messages） 
    messages.insertAdjacentHTML('afterbegin', html);
    newMessage.value='';
    // Called when there's incoming data on the websocket for this channel
  }
});