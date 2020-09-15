import consumer from "./consumer"

consumer.subscriptions.create("MessageChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    // Called when there's incoming data on the websocket for this channel
    const html = `<p>${data.content.text}</p>`;
    const messages = document.getElementById('messages');
    const newMessage = document.getElementById('message_text');
    messages.insertAdjacentHTML('afterbegin', html);
    newMessage.value='';
  }
});


<h3>mini_talk_app</h3>
<%= form_with model: @message do |f| %>
  <%= f.text_field :text %>
  <%= f.submit '送信' %>
<% end %>
<div id='messages'>
  <% @messages.reverse_each do |message| %>
    <p><%= message.text %></p>
  <% end %>
</div>


<div class="comment-box">
      <%= form_with(model: [@item, @comment], local: true) do |form| %>
      <%= form.text_area :text, class:"comment-text" %>

          <p class="comment-warn">
          相手のことを考え丁寧なコメントを心がけましょう。
          <br>
          不快な言葉遣いなどは利用制限や退会処分となることがあります。
          </p>
        <%= form.submit "コメントする",class:"comment-btn"%>
    </div>