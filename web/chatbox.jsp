<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Chatbox</title>
        <style>
            body {
                margin: 0;
                font-family: Arial;
            }

            #open-chat {
                position: fixed;
                bottom: 20px;
                right: 20px;
                width: 60px;
                height: 60px;
                border: none;
                border-radius: 50%;
                background: black;
                color: white;
                font-size: 25px;
                cursor: pointer;
                z-index: 999;
            }

            #chat-popup {
                position: fixed;
                bottom: 90px;
                right: 20px;
                width: 350px;
                height: 500px;
                background: white;
                border-radius: 15px;
                overflow: hidden;
                box-shadow: 0 0 15px rgba(0,0,0,0.3);
                display: flex;
                flex-direction: column;
            }

            #chat-header {
                background: black;
                color: white;
                padding: 15px;
                font-weight: bold;
                display: flex;
                justify-content: space-between;
                align-items: center;
            }

            #chat-box {
                flex: 1;
                padding: 15px;
                overflow-y: auto;
                background: #f5f5f5;
            }

            #chat-input {
                display: flex;
                height: 60px;
                border-top: 1px solid #ccc;
            }

            #message {
                flex: 1;
                border: none;
                padding: 15px;
                font-size: 15px;
                outline: none;
            }

            #chat-input button {
                width: 80px;
                border: none;
                background: black;
                color: white;
                cursor: pointer;
                font-weight: bold;
            }

            .user-msg {
                text-align: right;
                margin: 10px 0;
            }

            .user-msg span {
                background: #0d6efd;
                color: white;
                padding: 10px 14px;
                border-radius: 10px;
                display: inline-block;
                max-width: 70%;
            }

            .bot-msg {
                text-align: left;
                margin: 10px 0;
            }

            .bot-msg span {
                background: #e4e6eb;
                padding: 10px 14px;
                border-radius: 10px;
                display: inline-block;
                max-width: 70%;
            }

            .typing span {
                background: #e4e6eb;
                padding: 10px 14px;
                border-radius: 10px;
                display: inline-block;
                color: #888;
                font-style: italic;
            }
        </style>
    </head>
    <body>

        <!-- NÚT CHAT -->
        <button id="open-chat" onclick="toggleChat()">💬</button>

        <!-- POPUP -->
        <div id="chat-popup" style="display:none;">

            <!-- HEADER -->
            <div id="chat-header">
                NTN SHOP SUPPORT
                <span style="cursor:pointer;" onclick="toggleChat()">✖</span>
            </div>

            <!-- KHUNG CHAT -->
            <div id="chat-box">
                <div class="bot-msg">
                    <span>Xin chào 👋 Tôi có thể giúp gì cho bạn?</span>
                </div>
            </div>

            <!-- INPUT -->
            <div id="chat-input">
                <input
                    type="text"
                    id="message"
                    placeholder="Nhập tin nhắn..."
                    onkeypress="handleEnter(event)"
                    >
                <button onclick="sendMessage()">Gửi</button>
            </div>

        </div>

        <script>
            function toggleChat() {
                var popup = document.getElementById("chat-popup");
                popup.style.display = (popup.style.display === "none") ? "flex" : "none";
            }

            function handleEnter(event) {
                if (event.key === "Enter") {
                    sendMessage();
                }
            }

            async function sendMessage() {
                var input = document.getElementById("message");
                var chatBox = document.getElementById("chat-box");
                var userMessage = input.value.trim();

                if (userMessage === "")
                    return;

                // Hiển thị tin nhắn user
                chatBox.innerHTML += '<div class="user-msg"><span>' + escapeHtml(userMessage) + '</span></div>';
                input.value = "";
                chatBox.scrollTop = chatBox.scrollHeight;

                // Hiển thị typing indicator
                var typingId = "typing-" + Date.now();
                chatBox.innerHTML += '<div class="bot-msg typing" id="' + typingId + '"><span>Đang soạn tin...</span></div>';
                chatBox.scrollTop = chatBox.scrollHeight;

                try {
                    var res = await fetch("${pageContext.request.contextPath}/chatbox", {
                        method: "POST",
                        headers: {
                            "Content-Type": "application/x-www-form-urlencoded"
                        },
                        body: "message=" + encodeURIComponent(userMessage)
                    });

                    var botReply = await res.text();

                    // Xóa typing indicator
                    var typingEl = document.getElementById(typingId);
                    if (typingEl)
                        typingEl.remove();

                    // Hiển thị phản hồi bot
                    chatBox.innerHTML += '<div class="bot-msg"><span>' + escapeHtml(botReply) + '</span></div>';

                } catch (err) {
                    var typingEl = document.getElementById(typingId);
                    if (typingEl)
                        typingEl.remove();

                    chatBox.innerHTML += '<div class="bot-msg"><span>⚠️ Lỗi kết nối. Vui lòng thử lại.</span></div>';
                }

                chatBox.scrollTop = chatBox.scrollHeight;
            }

            function escapeHtml(text) {
                var div = document.createElement('div');
                div.appendChild(document.createTextNode(text));
                return div.innerHTML;
            }
        </script>

    </body>
</html>