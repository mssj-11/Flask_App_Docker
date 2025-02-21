from flask import Flask, render_template
import requests

app = Flask(__name__)

def get_characters():
    url = "https://rickandmortyapi.com/api/character"
    response = requests.get(url)
    if response.status_code == 200:
        return response.json().get("results", [])
    return []

@app.route('/')
def home():
    characters = get_characters()
    return render_template("index.html", characters=characters)

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
