from robot.api.deco import keyword
import easyocr

reader = easyocr.Reader(['en'])

@keyword("Doc Captcha")
def read_captcha(path='captcha.png'):
    results = reader.readtext(path)
    if results:
        best_match = max(results, key=lambda r: r[2])
        return best_match[1].strip()
    return ""
