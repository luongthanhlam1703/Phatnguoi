*** Settings ***
Library    SeleniumLibrary    run_on_failure=NOTHING
Library    SeleniumLibrary
Library    filepy/captcha.py
Library    filepy/world.py

*** Variables ***

${url}          https://www.csgt.vn/tra-cuu-phuong-tien-vi-pham.html
${trinhduyet}   Chrome
${bienso}       98A-370.17
${loaixe}       Ô tô

*** Test Cases ***

Chuong trinh dang chay
    Open Browser    ${url}    ${trinhduyet}
    Maximize Browser Window

    ${thongbaoloi}=    Set Variable    True
    ${solanlap}=     Set Variable    1

    WHILE    '${thongbaoloi}' == 'True' and ${solanlap} <= 999
        Wait Until Element Is Visible    //input[@name="BienKiemSoat"]    timeout=10s
        Input Text    //input[@name="BienKiemSoat"]    ${bienso}
        Select From List By Label    //select[@name="LoaiXe"]    ${loaixe}

        Wait Until Element Is Visible    //*[@id="imgCaptcha"]    timeout=10s
        ${captcha}=    Get WebElement    //*[@id="imgCaptcha"]
        Capture Element Screenshot    ${captcha}    captcha.png

        ${noidungcaptcha}=    Doc Captcha    captcha.png
        Log    CAPTCHA: ${noidungcaptcha}    console=True
        Input Text    //input[@name="txt_captcha"]    ${noidungcaptcha}
        Click Element    xpath://input[@class='btnTraCuu']
        # dừng 5s để xem nó có hiển thị thông báo mã xác nhận sai hay không
        Sleep    5s

        ${thongbaoloi}=    Run Keyword And Return Status    Page Should Contain Element    xpath=//div[@class='xe_texterror' and contains(text(), 'Mã xác nhận sai!')]
        # nêu thông báo lỗi có xuất hiện trên web = true, thì sẽ thông báo
        Run Keyword If    '${thongbaoloi}' == 'True'    Log    CAPTCHA sai, thử lại lần ${solanlap}    console=True
        # và reload lại trang
        Run Keyword If    '${thongbaoloi}' == 'True'    Reload Page
        Run Keyword If    '${thongbaoloi}' == 'True'    Sleep    2s
        ${solanlap}=    Evaluate    ${solanlap} + 1
    END

    Run Keyword If    '${thongbaoloi}' == 'False'     Log    Tra cứu thành công    console=True
        Sleep    2s
        # lấy nội dung sử dụng Get Text
        ${noidung}=    Get Text    xpath=//*[@id="bodyPrint123"]
        Log    Nội dung tra cứu: ${noidung}    console=True
        # lưu vào world
        Save Content To Word    ${noidung}    ketquatracuu/ketquatracuu.docx
    Close Browser


