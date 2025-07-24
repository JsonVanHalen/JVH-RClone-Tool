# gui/folder_selector.py

import json, os
from datetime import datetime
from PyQt5.QtWidgets import (
    QApplication, QWidget, QLabel, QLineEdit, QPushButton,
    QFileDialog, QVBoxLayout, QHBoxLayout
)

class SyncConfigurator(QWidget):
    def __init__(self):
        super().__init__()
        self.setWindowTitle("📁 Folder Sync Setup")
        self.source_field = QLineEdit()
        self.dest_field = QLineEdit()
        self.init_ui()

    def init_ui(self):
        layout = QVBoxLayout()

        layout.addLayout(self._add_field("Source Folder:", self.source_field))
        layout.addLayout(self._add_field("Destination Folder:", self.dest_field))

        save_btn = QPushButton("💾 Save Config")
        save_btn.clicked.connect(self.save_config)
        layout.addWidget(save_btn)

        self.setLayout(layout)

    def _add_field(self, label_text, field):
        layout = QHBoxLayout()
        layout.addWidget(QLabel(label_text))
        layout.addWidget(field)
        browse_btn = QPushButton("Browse")
        browse_btn.clicked.connect(lambda: self.pick_folder(field))
        layout.addWidget(browse_btn)
        return layout

    def pick_folder(self, field):
        folder = QFileDialog.getExistingDirectory(self, "Select Folder")
        if folder:
            field.setText(folder)

    def save_config(self):
        config = {
            "sync_job": {
                "source_path": self.source_field.text(),
                "destination_path": self.dest_field.text(),
                "created_at": datetime.utcnow().isoformat(),
                "last_modified": datetime.utcnow().isoformat()
            }
        }
        os.makedirs("config", exist_ok=True)
        with open("config/default_config.json", "w") as f:
            json.dump(config, f, indent=2)
        print("✅ Config saved to config/default_config.json")

if __name__ == "__main__":
    app = QApplication([])
    window = SyncConfigurator()
    window.show()
    app.exec_()
