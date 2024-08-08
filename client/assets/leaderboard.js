async function load() {
  const options = {
    method: "GET",
    headers: {
      authorization: localStorage.getItem("token"),
      Accept: "application/json",
      "Content-Type": "application/json",
    },
  };
  console.log("loading leaderboard");
  const response = await fetch(
    "http://localhost:3000/leaderboard/students",
    options
  );
  const resp = await response.json();
  console.log({ resp });
  resp.data.forEach((student) => {
    console.log("leaderboard.js", student.rank);
    const tr = document.createElement("tr");
    const tdName = document.createElement("td");
    tdName.textContent = student.name;
    const tdRank = document.createElement("td");
    if (student.rank === 1){
      tdRank.textContent = "Prime Minister"
    } else if (student.rank == 2) {
      tdRank.textContent = "Deputy Prime Minister"
    } else if (student.rank == 3) {
      tdRank.textContent = "Minister"
    } else if (student.rank == 4) {
      tdRank.textContent = "Governor"
    } else {
      student.rank == 5
      tdRank.textContent = "Mayor"
    }
    // tdRank.textContent = student.rank;
    const tdScore = document.createElement("td");
    tdScore.textContent = student.score;
    tr.appendChild(tdName);
    tr.appendChild(tdRank);
    tr.appendChild(tdScore);
    document.querySelector("#leaderboardBody").appendChild(tr);
  });
}
load();
 