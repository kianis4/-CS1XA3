from django.shortcuts import render
from .models import UserScore
from django.http import HttpResponseRedirect, HttpResponse, HttpResponseServerError, HttpResponseBadRequest, JsonResponse
import json # For parsing JSON


def main_game(request):
    return render(request, "Project3App.html")

# json {"method": <store_score, retrieve_score> , "parameter" : number}

def jsongoeshere(request):
    if request.method == 'POST':
        json_data = json.loads(request.body)
        request_type = json_data["method"]
        request_para = json_data["parameter"]

        if "store_score" == request_type:
            try:
                instance = UserScore(score=request_para, user_name=request.user)
                instance.save()
                dict_response = {"response": "store", "value": "Success"}
                return JsonResponse (dict_response)
            except Exception:
                dict_response = {"response": "store", "value": "No Score Available"}
                return JsonResponse (dict_response)

        elif "retrieve_score" == request_type:
            fullQuery = UserScore.objects.filter(user_name=request.user).order_by("-score")
            highestScore = fullQuery[0]
            hScore = highestScore.score

            fullQueryServer = UserScore.objects.all().order_by("-score")
            highestScoreServer = fullQueryServer[0]
            hScoreServer = highestScoreServer.score
            print ("Highest Score == ", hScore)
            print ("Highest Score Server == ", hScoreServer)
            dict_response = {"result2": str(hScoreServer), "result": str(hScore)}
            return JsonResponse (dict_response) 


    return HttpResponseServerError("Data Corrupted")
