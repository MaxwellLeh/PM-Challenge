const form= document.querySelector("#feedbackForm")

form.addEventListener("submit", async (e)=> {
    e.preventDefault()
    const formData=new FormData(e.target)
    console.log(formData);
    const options= {
        method:"POST",
        headers: {
                "Content-Type":"application/json"
                
        },
        body: JSON.stringify( { role: formData.get("role"),
            rating: parseInt(formData.get("rating")),
            comments: formData.get("comments"),
            improvements: formData.get("improvements"),
            additional_comments: formData.get("additional_comments")
        }),
    }; 
    console.log(options);

    const response = await fetch("http://127.0.0.1:3000/feedback",options);

if(!response.ok){
console.log("Error");
}else{
window.location.href= "../board.html"
}

 
})

