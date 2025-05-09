import os
from docx import Document

def save_content_to_word(content, output_file):
    os.makedirs(os.path.dirname(output_file), exist_ok=True)

    base_dir = os.path.dirname(output_file)
    base_name = os.path.basename(output_file)
    full_path = os.path.join(base_dir, base_name)

    if not os.path.exists(full_path):
        final_path = full_path
    else:
        i = 1
        name_only = base_name
        while True:
            new_name = f"{i}{name_only}"
            final_path = os.path.join(base_dir, new_name)
            if not os.path.exists(final_path):
                break
            i += 1

    doc = Document()
    doc.add_paragraph(content)
    doc.save(final_path)
