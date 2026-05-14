<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String pct = "%";
    String keyframes = "@keyframes bop {"
        + "from { transform: translateY(0); }"
        + "50" + pct + " { transform: translateY(-6px); }"
        + "to { transform: translateY(0); }"
        + "}";
%>
<style>
    /* NÚT MỞ CHAT */
    #chatToggle {
        position: fixed;
        bottom: 24px; right: 24px;
        width: 52px; height: 52px;
        background: #1a1a1a;
        border: none; border-radius: 50%;
        color: white; font-size: 22px;
        cursor: pointer;
        box-shadow: 0 4px 16px rgba(0,0,0,0.35);
        z-index: 9999;
        display: flex; align-items: center; justify-content: center;
        transition: transform .2s;
    }
    #chatToggle:hover { transform: scale(1.1); }

    /* KHUNG CHAT */
    #chatWidget {
        position: fixed;
        bottom: 88px; right: 24px;
        width: 360px;
        background: #fff;
        border-radius: 18px;
        box-shadow: 0 8px 32px rgba(0,0,0,0.18);
        display: none;
        flex-direction: column;
        overflow: hidden;
        z-index: 9998;
        font-family: 'Segoe UI', sans-serif;
    }
    #chatWidget.open { display: flex; }

    /* HEADER */
    .cw-header {
        background: #1a1a1a;
        color: white;
        padding: 14px 16px;
        display: flex; align-items: center; gap: 10px;
    }
    .cw-header .av {
        width: 36px; height: 36px;
        background: rgba(255,255,255,0.15);
        border-radius: 50%;
        display: flex; align-items: center; justify-content: center;
        font-size: 16px; flex-shrink: 0;
    }
    .cw-header h2 { font-size: 14px; font-weight: 600; margin: 0 0 2px; }
    .cw-header p  { font-size: 11px; opacity: .85; margin: 0; }

    .online-dot {
        width: 7px; height: 7px;
        background: #4ade80;
        border-radius: 50%;
        display: inline-block;
        margin-right: 4px;
    }

    /* NÚT ĐÓNG */
    .cw-close {
        margin-left: auto;
        background: none; border: none;
        color: white; font-size: 18px;
        cursor: pointer; opacity: .8;
        line-height: 1;
    }
    .cw-close:hover { opacity: 1; }

    /* VÙNG TIN NHẮN */
    #cwBox {
        height: 340px;
        overflow-y: auto;
        padding: 14px 12px;
        display: flex; flex-direction: column; gap: 10px;
        background: #f8f9ff;
    }
    #cwBox::-webkit-scrollbar { width: 4px; }
    #cwBox::-webkit-scrollbar-thumb { background: #d0d4e8; border-radius: 4px; }

    /* BUBBLE WRAP */
    .bw { display: flex; align-items: flex-end; gap: 7px; }
    .bw.user { flex-direction: row-reverse; }

    /* AVATAR */
    .bav {
        width: 26px; height: 26px;
        border-radius: 50%;
        display: flex; align-items: center; justify-content: center;
        font-size: 11px; color: white; flex-shrink: 0;
    }
    .bav.ai   { background: #1a1a1a; }
    .bav.user { background: #555555; }

    /* BUBBLE */
    .bubble {
        max-width: 78%; padding: 9px 13px;
        border-radius: 14px; font-size: 13px;
        line-height: 1.55; word-break: break-word; white-space: pre-wrap;
    }
    .bubble.user {
        background: #1a1a1a;
        color: white;
        border-bottom-right-radius: 3px;
    }
    .bubble.ai {
        background: white; color: #1a1f2e;
        border: 1px solid #e0e0e0;
        border-bottom-left-radius: 3px;
        box-shadow: 0 1px 4px rgba(0,0,0,0.06);
    }

    /* THỜI GIAN */
    .bt { font-size: 10px; color: #aab; margin-top: 2px; padding: 0 3px; }
    .bw.user .bt { text-align: right; }

    /* TYPING INDICATOR */
    .typing-bw { display: none; }
    .typing-bw.show { display: flex; }
    .dots { display: flex; gap: 4px; padding: 2px 0; }
    .dots span {
        width: 6px; height: 6px;
        background: #c0c4d8; border-radius: 50%;
        animation: bop 1.2s infinite;
    }
    .dots span:nth-child(2) { animation-delay: .2s; }
    .dots span:nth-child(3) { animation-delay: .4s; }
    <%=keyframes%>

    /* INPUT */
    .cw-input {
        padding: 10px 12px;
        border-top: 1px solid #eef0f8;
        display: flex; gap: 8px; align-items: flex-end;
        background: white;
    }
    #cwMsg {
        flex: 1;
        border: 1.5px solid #e0e4f0; border-radius: 20px;
        padding: 8px 14px; font-size: 13px;
        outline: none; resize: none; max-height: 80px;
        font-family: inherit; color: #1a1f2e;
        background: #f8f9ff; transition: border-color .2s;
    }
    #cwMsg:focus { border-color: #1a1a1a; background: white; }
    #cwMsg::placeholder { color: #b0b8cc; }

    /* NÚT GỬI */
    .btn-cw-send {
        width: 38px; height: 38px;
        background: #1a1a1a;
        border: none; border-radius: 50%;
        color: white; font-size: 14px;
        cursor: pointer;
        display: flex; align-items: center; justify-content: center;
        flex-shrink: 0; transition: opacity .2s, transform .15s;
    }
    .btn-cw-send:hover:not(:disabled) { opacity: .75; transform: scale(1.06); }
    .btn-cw-send:disabled { opacity: .4; cursor: not-allowed; }
</style>

<!-- NÚT CHAT NỔI -->
<button id="chatToggle" onclick="toggleChat()" title="Chat với AI">
    <i class="fa fa-comment-dots"></i>
</button>

<!-- WIDGET CHAT -->
<div id="chatWidget">
    <div class="cw-header">
        <div class="av"><i class="fa fa-comment-dots"></i></div>
        <div>
            <h2>NTN Support</h2>
            <p><span class="online-dot"></span>Đang hoạt động</p>
        </div>
        <button class="cw-close" onclick="toggleChat()">&#x2715;</button>
    </div>

    <div id="cwBox">
        <div class="bw">
            <div class="bav ai"><i class="fa fa-comment-dots"></i></div>
            <div>
                <div class="bubble ai">Xin chào! Tôi có thể giúp gì cho bạn? 😊</div>
                <div class="bt">Vừa xong</div>
            </div>
        </div>
        <div class="bw typing-bw" id="cwTyping">
            <div class="bav ai"><i class="fa fa-robot"></i></div>
            <div class="bubble ai" style="padding:9px 14px;">
                <div class="dots"><span></span><span></span><span></span></div>
            </div>
        </div>
    </div>

    <div class="cw-input">
        <textarea id="cwMsg" rows="1" placeholder="Nhập tin nhắn..."></textarea>
        <button class="btn-cw-send" id="cwSendBtn" onclick="cwSend()">
            <i class="fa fa-paper-plane"></i>
        </button>
    </div>
</div>

<script>
    const cwBox    = document.getElementById("cwBox");
    const cwTyping = document.getElementById("cwTyping");
    const cwSendBtn= document.getElementById("cwSendBtn");
    const cwMsg    = document.getElementById("cwMsg");

    function toggleChat() {
        document.getElementById("chatWidget").classList.toggle("open");
    }

    cwMsg.addEventListener("input", function () {
        this.style.height = "auto";
        this.style.height = Math.min(this.scrollHeight, 80) + "px";
    });
    cwMsg.addEventListener("keydown", function (e) {
        if (e.key === "Enter" && !e.shiftKey) { e.preventDefault(); cwSend(); }
    });

    function cwNow() {
        return new Date().toLocaleTimeString('vi-VN', { hour: '2-digit', minute: '2-digit' });
    }

    function cwAddMsg(text, role) {
        cwTyping.classList.remove("show");
        const wrap = document.createElement("div");
        wrap.className = "bw " + role;

        const av = document.createElement("div");
        av.className = "bav " + role;
        av.innerHTML = role === "ai" ? '<i class="fa fa-comment-dots"></i>' : '<i class="fa fa-user"></i>';

        const inner   = document.createElement("div");
        const bubble  = document.createElement("div");
        bubble.className = "bubble " + role;
        bubble.textContent = text;

        const timeEl  = document.createElement("div");
        timeEl.className = "bt";
        timeEl.textContent = cwNow();

        inner.appendChild(bubble);
        inner.appendChild(timeEl);
        wrap.appendChild(av);
        wrap.appendChild(inner);
        cwBox.insertBefore(wrap, cwTyping);
        cwBox.scrollTop = cwBox.scrollHeight;
    }

    function cwSend() {
        const msg = cwMsg.value.trim();
        if (!msg) return;

        cwAddMsg(msg, "user");
        cwMsg.value = "";
        cwMsg.style.height = "auto";
        cwSendBtn.disabled = true;
        cwTyping.classList.add("show");
        cwBox.scrollTop = cwBox.scrollHeight;

        fetch("${pageContext.request.contextPath}/chat", {
            method: "POST",
            headers: { "Content-Type": "application/x-www-form-urlencoded; charset=UTF-8" },
            body: "message=" + encodeURIComponent(msg)
        })
        .then(r => { if (!r.ok) throw new Error("HTTP " + r.status); return r.text(); })
        .then(data => cwAddMsg(data, "ai"))
        .catch(err  => cwAddMsg("Lỗi kết nối: " + err.message, "ai"))
        .finally(()  => { cwSendBtn.disabled = false; cwTyping.classList.remove("show"); });
    }
</script>