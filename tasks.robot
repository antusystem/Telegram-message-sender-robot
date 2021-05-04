*** Settings ***
Documentation   Template robot for sending POST Request to Telegram
Library         RPA.Robocloud.Secrets
Library         RPA.Notifier
Library         RPA.HTTP


*** Variables ***
${chat_id}    123456789
${text}       Here goes the message from post, sended from Robocorp Lab
&{data}=      chat_id=${chat_id}    text=${text}

*** Tasks ***
Send Message to Telegram

    ${token}=    Get Secret    Telegram
    
    # Using Notify is far more easier
    Notify Telegram    Text send from Robocorp Lab    ${chat_id}    ${token}[Token]
        
    # Using a post request, more complicated, but, if you want to use more features from telegram this template will work
    Create Session    alias=Telegram    url=https://api.telegram.org   headers={"Content-Type": "application/json", "Host": "api.telegram.org"}     timeout=5    verify=${CURDIR}${/}telegram_certificate.pem
    Post Request      alias=Telegram    uri=bot${token}[Token]/getMe
    Post Request      alias=Telegram    uri=bot${token}[Token]/sendMessage    json=${data}
