//The list of questions for oue quiz app.
const questions = [
    { questionText:'Flutter is open-source', answer: 'true' },
    { questionText:'Amazon owns Flutter', answer: 'false' },
    { questionText:'Flutter for Web and Desktop is now stable', answer: 'true' },
    { questionText:'Sparky is Flutter\'s official mascot', answer: 'false' },
    { questionText:'Flutter was released in 2020', answer: 'false' },
];

//This intent is the starting point of our app.
//The user can say Start, Start the quiz or Let's begin to start the quiz.
intent('Start (the quiz|)','Let\'s begin', p => {
    p.play('Instructions for the quiz: You can play this quiz either using the G.U.I that is by pressing the buttons on your screens or play it with touchless voice interactions');
    p.play('Say ok to start the quiz');
    //Go to the readQuestion context
    p.then(readQuestion);
});

//initialising variables
let index = 0;
let score = 0;

let readQuestion = context(()=>{
    intent('(Ok|Yes)',p=>{
    if(index>0){
        //send the command to the voice app in order to update the question on the screen.
        p.play({command: 'next', item: score});
    }
    //Read the question at the current index.
    p.play(`${questions[index].questionText}. True or False`);
    //Go to the getAnswer context
    p.then(getAnswer);
    });
    
})

let getAnswer = context(()=>{
    //Get the answer i.e either true or false
    intent(`$(ANSWER true|false)`, p=>{
        if(p.ANSWER.value == questions[index].answer){
           //If the answer is correct, update the score
           score += 10;
           p.play('(That\'s right|Great going)');
        }
        else{
           //For every wrong answer deduct 1 from the score
           score -= 1;
           p.play('Sorry, That\'s not right');
        }
        
        //increment the index by one
        index++;
        
        //Read the next question if there are more questions left
        if(index < questions.length){
        p.play('(Are you|) Ready for the next question?'); 
        p.then(readQuestion);
        }
       else{
               //Otherwise got to the score page
               p.play({command: 'next', item: score});
               p.play(`Your score is: ${score}`);
               p.resolve();
               p.play('Thank you for playing!');
               index=0;
               score=0;
           }
    });
});