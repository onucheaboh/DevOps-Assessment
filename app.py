from flask import Flask, jsonify

app = Flask(__name__)

@app.route('/')
def get_blob_contents():
    # Code to retrieve contents from Azure Blob Storage
    blob_contents = {"example": "data"}
    return jsonify(blob_contents)

if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0')
