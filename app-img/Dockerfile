FROM microsoft/aspnetcore

#Can't get ARG to work.. on d-c up does not pass values?'

WORKDIR /home/local/app

COPY out .

EXPOSE 5000/tcp

ENTRYPOINT ["dotnet", "Program.dll"]

