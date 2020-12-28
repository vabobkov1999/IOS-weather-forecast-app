import Foundation

let jsonCities = """
[
    {
        "id": 524894,
        "name": "Moscow",
        "state": "",
        "country": "RU",
        "coord": {
            "lon": 37.606667,
            "lat": 55.761665
        }
    },
    {
        "id": 524925,
        "name": "Moscow Oblast",
        "state": "",
        "country": "RU",
        "coord": {
            "lon": 37.628334,
            "lat": 55.75639
        }
    },
    {
        "id": 498817,
        "name": "Saint Petersburg",
        "state": "",
        "country": "RU",
        "coord": {
            "lon": 30.264168,
            "lat": 59.894444
        }
    },
    {
        "id": 536199,
        "name": "Leningradskaya Oblast’",
        "state": "",
        "country": "RU",
        "coord": {
            "lon": 32.0,
            "lat": 60.0
        }
    },
    {
        "id": 1496745,
        "name": "Novosibirskaya Oblast’",
        "state": "",
        "country": "RU",
        "coord": {
            "lon": 80.0,
            "lat": 55.0
        }
    },
    {
        "id": 1496747,
        "name": "Novosibirsk",
        "state": "",
        "country": "RU",
        "coord": {
            "lon": 82.934441,
            "lat": 55.041111
        }
    },
    {
        "id": 1486209,
        "name": "Yekaterinburg",
        "state": "",
        "country": "RU",
        "coord": {
            "lon": 60.612499,
            "lat": 56.857498
        }
    },
    {
        "id": 551487,
        "name": "Kazan",
        "state": "",
        "country": "RU",
        "coord": {
            "lon": 49.122139,
            "lat": 55.788738
        }
    },
    {
            "id": 495344,
            "name": "Shchelkovo",
            "state": "",
            "country": "RU",
            "coord": {
                "lon": 37.99139,
                "lat": 55.921665
            }
        },
    {
        "id": 536203,
        "name": "Saint Petersburg",
        "state": "",
        "country": "RU",
        "coord": {
            "lon": 30.25,
            "lat": 59.916668
        }
    },
    {
        "id": 520555,
        "name": "Nizhniy Novgorod",
        "state": "",
        "country": "RU",
        "coord": {
            "lon": 44.002048,
            "lat": 56.328674
        }
    },
    {
        "id": 1508291,
        "name": "Chelyabinsk",
        "state": "",
        "country": "RU",
        "coord": {
            "lon": 61.429722,
            "lat": 55.154442
        }
    },
    {
        "id": 1508290,
        "name": "Chelyabinskaya Oblast’",
        "state": "",
        "country": "RU",
        "coord": {
            "lon": 60.5,
            "lat": 54.0
        }
    },
    {
        "id": 499099,
        "name": "Samara",
        "state": "",
        "country": "RU",
        "coord": {
            "lon": 50.150002,
            "lat": 53.200001
        }
    },
    {
        "id": 499068,
        "name": "Samarskaya Oblast’",
        "state": "",
        "country": "RU",
        "coord": {
            "lon": 50.0,
            "lat": 53.0
        }
    },
    {
        "id": 515001,
        "name": "Orenburgskaya Oblast’",
        "state": "",
        "country": "RU",
        "coord": {
            "lon": 56.0,
            "lat": 52.0
        }
    },
    {
        "id": 1496153,
        "name": "Omsk",
        "state": "",
        "country": "RU",
        "coord": {
            "lon": 73.400002,
            "lat": 55.0
        }
    },
    {
        "id": 1496152,
        "name": "Omskaya Oblast’",
        "state": "",
        "country": "RU",
        "coord": {
            "lon": 73.0,
            "lat": 56.0
        }
    },
    {
        "id": 501175,
        "name": "Rostov-na-Donu",
        "state": "",
        "country": "RU",
        "coord": {
            "lon": 39.71389,
            "lat": 47.236389
        }
    },
    {
        "id": 501165,
        "name": "Rostovskaya Oblast’",
        "state": "",
        "country": "RU",
        "coord": {
            "lon": 42.0,
            "lat": 47.0
        }
    },
    {
        "id": 479561,
        "name": "Ufa",
        "state": "",
        "country": "RU",
        "coord": {
            "lon": 56.037498,
            "lat": 54.775002
        }
    },
    {
        "id": 479553,
        "name": "Ufimskiy",
        "state": "",
        "country": "RU",
        "coord": {
            "lon": 58.051701,
            "lat": 56.708401
        }
    },
    {
        "id": 1502026,
        "name": "Krasnoyarsk",
        "state": "",
        "country": "RU",
        "coord": {
            "lon": 92.791672,
            "lat": 56.00972
        }
    },
    {
        "id": 1502020,
        "name": "Krasnoyarskiy Kray",
        "state": "",
        "country": "RU",
        "coord": {
            "lon": 93.0,
            "lat": 58.0
        }
    },
    {
        "id": 472045,
        "name": "Voronezh",
        "state": "",
        "country": "RU",
        "coord": {
            "lon": 39.169998,
            "lat": 51.666389
        }
    },
    {
        "id": 472039,
        "name": "Voronezhskaya Oblast’",
        "state": "",
        "country": "RU",
        "coord": {
            "lon": 40.5,
            "lat": 51.0
        }
    },
    {
        "id": 511196,
        "name": "Perm",
        "state": "",
        "country": "RU",
        "coord": {
            "lon": 56.285519,
            "lat": 58.01741
        }
    },
    {
        "id": 511180,
        "name": "Perm Krai",
        "state": "",
        "country": "RU",
        "coord": {
            "lon": 57.0,
            "lat": 59.0
        }
    },
    {
        "id": 472757,
        "name": "Volgograd",
        "state": "",
        "country": "RU",
        "coord": {
            "lon": 44.501839,
            "lat": 48.719391
        }
    },
    {
        "id": 472755,
        "name": "Volgogradskaya Oblast’",
        "state": "",
        "country": "RU",
        "coord": {
            "lon": 44.0,
            "lat": 49.0
        }
    },
    {
        "id": 542420,
        "name": "Krasnodar",
        "state": "",
        "country": "RU",
        "coord": {
            "lon": 38.976944,
            "lat": 45.03278
        }
    },
    {
        "id": 542415,
        "name": "Krasnodarskiy Kray",
        "state": "",
        "country": "RU",
        "coord": {
            "lon": 40.0,
            "lat": 45.0
        }
    },
    {
        "id": 498677,
        "name": "Saratov",
        "state": "",
        "country": "RU",
        "coord": {
            "lon": 46.033333,
            "lat": 51.566666
        }
    },
    {
        "id": 498672,
        "name": "Saratovskaya",
        "state": "",
        "country": "RU",
        "coord": {
            "lon": 39.224445,
            "lat": 44.710278
        }
    },
    {
        "id": 515003,
        "name": "Orenburg",
        "state": "",
        "country": "RU",
        "coord": {
            "lon": 55.098801,
            "lat": 51.772701
        }
    },
    {
        "id": 5106292,
        "name": "West New York",
        "state": "NJ",
        "country": "US",
        "coord": {
            "lon": -74.014313,
            "lat": 40.78788
        }
    },
    {
        "id": 5115985,
        "name": "East New York",
        "state": "NY",
        "country": "US",
        "coord": {
            "lon": -73.882362,
            "lat": 40.666771
        }
    },
    {
        "id": 5128581,
        "name": "New York City",
        "state": "NY",
        "country": "US",
        "coord": {
            "lon": -74.005966,
            "lat": 40.714272
        }
    },
    {
        "id": 5344994,
        "name": "East Los Angeles",
        "state": "CA",
        "country": "US",
        "coord": {
            "lon": -118.17202,
            "lat": 34.023899
        }
    },
    {
        "id": 5368361,
        "name": "Los Angeles",
        "state": "CA",
        "country": "US",
        "coord": {
            "lon": -118.243683,
            "lat": 34.052231
        }
    },
    {
        "id": 3582383,
        "name": "Chicago",
        "state": "",
        "country": "BZ",
        "coord": {
            "lon": -88.300003,
            "lat": 17.799999
        }
    },
    {
        "id": 4391354,
        "name": "Houston",
        "state": "MO",
        "country": "US",
        "coord": {
            "lon": -91.955994,
            "lat": 37.32616
        }
    },
    {
        "id": 4905873,
        "name": "Phoenix",
        "state": "IL",
        "country": "US",
        "coord": {
            "lon": -87.634773,
            "lat": 41.611149
        }
    },
    {
        "id": 5131095,
        "name": "Philadelphia",
        "state": "NY",
        "country": "US",
        "coord": {
            "lon": -75.708817,
            "lat": 44.154499
        }
    },
    {
        "id": 4726206,
        "name": "San Antonio",
        "state": "TX",
        "country": "US",
        "coord": {
            "lon": -98.493629,
            "lat": 29.42412
        }
    },
    {
        "id": 4726311,
        "name": "San Diego",
        "state": "TX",
        "country": "US",
        "coord": {
            "lon": -98.238899,
            "lat": 27.76391
        }
    },
    {
        "id": 5186266,
        "name": "Dallas",
        "state": "PA",
        "country": "US",
        "coord": {
            "lon": -75.963249,
            "lat": 41.336189
        }
    },
    {
        "id": 5392171,
        "name": "San Jose",
        "state": "CA",
        "country": "US",
        "coord": {
            "lon": -121.894958,
            "lat": 37.33939
        }
    },
    {
        "id": 4254010,
        "name": "Austin",
        "state": "IN",
        "country": "US",
        "coord": {
            "lon": -85.808029,
            "lat": 38.758389
        }
    },
    {
        "id": 4473083,
        "name": "Jacksonville",
        "state": "NC",
        "country": "US",
        "coord": {
            "lon": -77.430237,
            "lat": 34.754051
        }
    },
    {
        "id": 298795,
        "name": "Republic of Turkey",
        "state": "",
        "country": "TR",
        "coord": {
            "lon": 34.911549,
            "lat": 39.05901
        }
    },
    {
        "id": 2017370,
        "name": "Russian Federation",
        "state": "",
        "country": "RU",
        "coord": {
            "lon": 100.0,
            "lat": 60.0
        }
    },
    {
        "id": 6087575,
        "name": "Germany",
        "state": "",
        "country": "CA",
        "coord": {
            "lon": -64.715469,
            "lat": 44.550152
        }
    },
    {
        "id": 2288873,
        "name": "France",
        "state": "",
        "country": "CI",
        "coord": {
            "lon": -3.7396,
            "lat": 5.20377
        }
    },
    {
        "id": 2635167,
        "name": "United Kingdom",
        "state": "",
        "country": "GB",
        "coord": {
            "lon": -2.69531,
            "lat": 54.758438
        }
    },
    {
        "id": 4700234,
        "name": "Italy",
        "state": "TX",
        "country": "US",
        "coord": {
            "lon": -96.88472,
            "lat": 32.18404
        }
    },
    {
        "id": 2510769,
        "name": "Spain",
        "state": "",
        "country": "ES",
        "coord": {
            "lon": -4.0,
            "lat": 40.0
        }
    },
    {
        "id": 690791,
        "name": "Ukraine",
        "state": "",
        "country": "UA",
        "coord": {
            "lon": 32.0,
            "lat": 49.0
        }
    },
    {
        "id": 3067696,
        "name": "Prague",
        "state": "",
        "country": "CZ",
        "coord": {
            "lon": 14.42076,
            "lat": 50.088039
        }
    },
]
"""

let jsonCitiesData: Data? = jsonCities.data(using: .utf8)
