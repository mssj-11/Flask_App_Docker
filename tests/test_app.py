import json
import requests
from unittest.mock import patch
from app import get_characters

def test_home_status_code(client):
    """Prueba si la página de inicio carga correctamente"""
    response = client.get('/')
    assert response.status_code == 200

@patch("app.requests.get")
def test_get_characters(mock_get):
    """Prueba si get_characters maneja correctamente la API externa"""
    mock_response = {
        "results": [
            {"name": "Rick Sanchez", "species": "Human", "status": "Alive", "image": "url", "location": {"name": "Earth"}}
        ]
    }
    mock_get.return_value.status_code = 200
    mock_get.return_value.json.return_value = mock_response

    characters = get_characters()
    assert len(characters) == 1
    assert characters[0]["name"] == "Rick Sanchez"

def test_home_content(client):
    """Prueba si la página de inicio contiene un título esperado"""
    response = client.get('/')
    assert b"Personajes de Rick and Morty" in response.data
