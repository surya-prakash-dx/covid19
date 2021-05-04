$(document).ready(function(){
    var url ="https://api.covid19india.org/data.json"

    $.get(url,function(data){
        console.log(data)

        var total_active,total_recovered,total_deaths,total_confirmed

        var state=[]
        var confirmed=[]
        var recovered=[]
        var active=[]
        var deaths=[]
 
        $.each(data.statewise,function(id,obj){
            state.push(obj.state)
            active.push(obj.active)
            confirmed.push(obj.confirmed)
            recovered.push(obj.recovered)
            deaths.push(obj.deaths)
        })

        console.log(state)
        state.shift()
        active.shift()
        confirmed.shift()
        recovered.shift()
        deaths.shift()

        total_active = data.statewise[0].active
        total_confirmed = data.statewise[0].confirmed
        total_recovered = data.statewise[0].recovered
        total_deaths=data.statewise[0].deaths

        $("#active").append(total_active)
        $("#confirmed").append(total_confirmed)
        $("#recovered").append(total_recovered)
        $("#deaths").append(total_deaths)

        var myChart = document.getElementById("myChart").getContext('2d')

        var chart = new Chart(myChart,{
            type:'bar',
            data:{
                labels:state,
                datasets:[
                    {
                        label:"CONFIRMED CASES",
                        data: confirmed,
                        backgroundColor:"#FFD700",
                        minBarLength:100,
                    },
                    {
                        label:"ACTIVE CASES",
                        data: active,
                        backgroundColor:"#0083F3",
                        minBarLength:100,
                    },
                    {
                        label:"RECOVERED",
                        data: recovered,
                        backgroundColor:"#008000",
                        minBarLength:100,
                    },
                    {
                        label:"DEATH CASES",
                        data: deaths,
                        backgroundColor:"#e74c3c",
                        minBarLength:100,
                    },
                ]
                
            },
            options:{}
        })
        var myChart1 = document.getElementById("myChart1").getContext('2d')

        var chart = new Chart(myChart1,{
            type:'pie',
            data:{
                labels:state,
                datasets:[
                    {
                        label:"CONFIRMED CASES",
                        data: confirmed,
                        backgroundColor:"#FFD700",
                        minBarLength:100,
                    },
                    {
                        label:"ACTIVE CASES",
                        data: active,
                        backgroundColor:"#0083F3",
                        minBarLength:100,
                    },
                    {
                        label:"RECOVERED",
                        data: recovered,
                        backgroundColor:"#008000",
                        minBarLength:100,
                    },
                    {
                        label:"DEATH CASES",
                        data: deaths,
                        backgroundColor:"#e74c3c",
                        minBarLength:100,
                    },
                ]
                
            },
            options:{}
        })

    })
})



  