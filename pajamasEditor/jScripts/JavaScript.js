//קוד להפעלת התפריט
$(document).ready(function () {
    $(".about").click(function () {
        $("#aboutDiv").toggle();
    });

    $(".howtoplay").click(function () {
        $("#howToPlayDiv").toggle();
    });

    $(".closeAbout").click(function () {
        $("#aboutDiv").hide();
    });

    $(".closeHowToPlay").click(function () {
        $("#howToPlayDiv").hide();
    });
});
 
var originalFormData;

//תמונה של שאלה
function openFileUploader0() {
    $('#FileUploadque').click();
}

//תמונות של מסיחים:
function openFileUploader1() {
    $('#FileUpload1').click();
}

function openFileUploader2() {
    $('#FileUpload2').click();
}

function openFileUploader3() {
    $('#FileUpload3').click();
}

function openFileUploader4() {
    $('#FileUpload4').click();
}

function openFileUploader5() {
    $('#FileUpload5').click();
}

function openFileUploader6() {
    $('#FileUpload6').click();
}

var isDirty = false;

$(document).ready(function () {

    originalFormData = $('form#form1').serialize();
    //העלאת תמונה של שאלה
    $("#FileUploadque").change(function () {
        isDirty = true;
        validateQuestions();
        if (this.files && this.files[0]) {
            var reader = new FileReader();

            reader.onload = function (e) {

                $('#queImagebtn').attr('src', e.target.result);
                $('#queImagesize').removeClass("hidesize");
                $('#queImagedelete').removeClass("hidedelete");
            }
            reader.readAsDataURL(this.files[0]);

        }
    });


    //העלאת תמונות של מסיחים
    $("#FileUpload1").change(function () {
        isDirty = true;
        validateQuestions();
        if (this.files && this.files[0]) {
            var reader = new FileReader();
            //אם עלתה תמונה - תיבת טקסט לא פעילה
            $("#ans1").attr('disabled', 'disabled');

            reader.onload = function (e) {
               
                $('#ImageforUpload1').attr('src', e.target.result);
                $('#imagesize1').removeClass("hidesize");
                $('#imagedelete1').removeClass("hidedelete");

            }
            reader.readAsDataURL(this.files[0]);
        }
    });




    //לאחר שלחצנו על התמונה שרצינו לבחור - תמונה מספר שתיים
    $("#FileUpload2").change(function () {
        isDirty = true;
        validateQuestions();
        if (this.files && this.files[0]) {
            var reader = new FileReader();
            //אם עלתה תמונה - תיבת טקסט לא פעילה
            $("#ans2").attr('disabled', 'disabled');
            reader.onload = function (e) {
                $('#ImageforUpload2').attr('src', e.target.result);
                $('#imagesize2').removeClass("hidesize");
                $('#imagedelete2').removeClass("hidedelete");

            }
            reader.readAsDataURL(this.files[0]);
        }
    });

    $("#FileUpload3").change(function () {
        isDirty = true;
        validateQuestions();
        if (this.files && this.files[0]) {
            var reader = new FileReader();
            //אם עלתה תמונה - תיבת טקסט לא פעילה
            $("#ans3").attr('disabled', 'disabled');
            reader.onload = function (e) {
                $('#ImageforUpload3').attr('src', e.target.result);
                $('#imagesize3').removeClass("hidesize");
                $('#imagedelete3').removeClass("hidedelete");

            }
            reader.readAsDataURL(this.files[0]);
        }
    });

    //לאחר שלחצנו על התמונה שרצינו לבחור - תמונה מספר שתיים
    $("#FileUpload4").change(function () {
        isDirty = true;
        validateQuestions();
        if (this.files && this.files[0]) {
            var reader = new FileReader();
            //אם עלתה תמונה - תיבת טקסט לא פעילה
            $("#ans4").attr('disabled', 'disabled');
            reader.onload = function (e) {
                $('#ImageforUpload4').attr('src', e.target.result);
                $('#imagesize4').removeClass("hidesize");
                $('#imagedelete4').removeClass("hidedelete");

            }
            reader.readAsDataURL(this.files[0]);
        }
    });
    
    $("#FileUpload5").change(function () {
        isDirty = true;
        validateQuestions();
        if (this.files && this.files[0]) {
            var reader = new FileReader();
            //אם עלתה תמונה - תיבת טקסט לא פעילה
            $("#ans5").prop('disabled', true);
            reader.onload = function (e) {
                $('#ImageforUpload5').attr('src', e.target.result);
                $('#imagesize5').removeClass("hidesize");
                $('#imagedelete5').removeClass("hidedelete");

            }
            reader.readAsDataURL(this.files[0]);
        }
    });

    //לאחר שלחצנו על התמונה שרצינו לבחור - תמונה מספר שתיים
    $("#FileUpload6").change(function (e) {
        isDirty = true;
        validateQuestions();
        if (this.files && this.files[0]) {
            var reader = new FileReader();
            $("#ans6").prop('disabled', true);
            reader.onload = function (e) {
                $('#ImageforUpload6').attr('src', e.target.result);
                $('#imagesize6').removeClass("hidesize");
                $('#imagedelete6').removeClass("hidedelete");

            }
            reader.readAsDataURL(this.files[0]);
        }
    });
    
    //קוד לקריאת תווים
    //בהקלדה בתיבת הטקסט
    $(".CharacterCount").keyup(function () {
        checkCharacter($(this)); //קריאה לפונקציה שבודקת את מספר התווים
    });

    //בהעתקה של תוכן לתיבת הטקסט
    $(".CharacterCount").on("paste", function () {
        checkCharacter($(this));//קריאה לפונקציה שבודקת את מספר התווים
    });

    //בהקלדה בתיבת הטקסט
    $(".charGameCount").keyup(function () {
        checkCharacter($(this)); //קריאה לפונקציה שבודקת את מספר התווים
    });

    //בהעתקה של תוכן לתיבת הטקסט
    $(".charGameCount").on("paste", function () {
        checkCharacter($(this));//קריאה לפונקציה שבודקת את מספר התווים
    }); 

    //בהקלדה בתיבת הטקסט
    $(".questionCount").keyup(function () {
        checkCharacter($(this)); //קריאה לפונקציה שבודקת את מספר התווים
    });

    //בהעתקה של תוכן לתיבת הטקסט
    $(".questionCount").on("paste", function () {
        checkCharacter($(this));//קריאה לפונקציה שבודקת את מספר התווים
    });

});

function checkCharacter(myTextBox) {

    var countCurrentC;
    if (myTextBox.val() == null) {
        countCurrentC = 0;
    } else {
        countCurrentC = myTextBox.val().length;
    }

    console.log(countCurrentC);

    var itemNumber = myTextBox.attr("item");


    var CharacterLimitNum = myTextBox.attr("CharacterLimit");
    var CharacterMin = myTextBox.attr("CharacterMin");


    if (countCurrentC > CharacterLimitNum) {

        myTextBox.val(myTextBox.val().substring(0, CharacterLimitNum));

        countCurrentC = CharacterLimitNum;
    }

    if (countCurrentC < CharacterMin || countCurrentC == CharacterLimitNum) {
        $("#LabelCounter" + itemNumber).css('color', 'red');
    } else if (countCurrentC == 0) {
        $("#LabelCounter" + itemNumber).css('color', 'black');
    }
    else {
        $("#LabelCounter" + itemNumber).css('color', 'black');

    }


    $("#LabelCounter" + itemNumber).text(countCurrentC + "/" + CharacterLimitNum);
}

function onTextChange(textbox, image) {
    isDirty = true;
    validateQuestions();
    console.log($(image).attr("src"));

    if (textbox.value == '') {
        image.disabled = false;
        image.classList.remove('blocked');
    }
    else {
        image.disabled = true;
        image.classList.add('blocked');
    }
}

function zoomImage(myControl) {
    var mySource = $(myControl).attr('src');
    $("#zoombackground").removeClass("hide");
    $("#imageBig").attr('src', mySource);
}

function exitImage() {
    $("#zoombackground").addClass("hide");
}


function onRadioChange() {
    isDirty = true;
    validateQuestions();
    var numOfQuestions = $('input[name="answerChoises"]:checked').val();
    if (numOfQuestions == '5') {
        $('#answer5').removeClass('hide');
        $('#answer6').addClass('hide');
    } else if (numOfQuestions == '6') {
        $('#answer5').removeClass('hide');
        $('#answer6').removeClass('hide');
    } else if (numOfQuestions == '4') {
        $('#answer5').addClass('hide');
        $('#answer6').addClass('hide');
    }

}

function validateQuestions() {
    var numOfQuestions = parseInt($('input[name="answerChoises"]:checked').val());
    var question = $('#questionTextBox');
    var isValid = !!question.val();
    if (isValid) {
        
        for (var i = 1; i <= numOfQuestions; i++) {
            var ans = $('#ans' + i);
            var image = $('#ImageforUpload' + i);
            if (!ans.val() && (image.attr('src') == "images/add.png")) {
                isValid = false;
            }
        }
    }

    var checked = $('input[name="AnswersGroup"]:checked')
    isValid = isValid && checked.length == 1;

    if (isValid) {
        console.log("valid q");
        // activate save btn
        $("#saveQuestion").parent().removeClass("button-blocked");
        $("#saveQuestion").removeAttr('disabled');
    } else {
        $("#saveQuestion").parent().addClass("button-blocked");
        $("#saveQuestion").attr('disabled', "true");
    }
}

//מחיקת תמונה של שאלה/מסיח
$(document).ready(function () {
    validateQuestions();

    checkCharacter($(".questionCount"));
    checkCharacter($("#gameNameTxt"));
    for (var i = 1; i <= 6; i++) {
        checkCharacter($("#ans" + i));
        $('#radAns' + i).change(function (e) {
            e.preventDefault();
            validateQuestions()
        });
        
    }


    $("#imagedelete1").click(function (e) {
        isDirty = true;
        validateQuestions()

        e.preventDefault();
        $("#imagesize1").addClass("hidesize");
        $("#imagedelete1").addClass("hidedelete");
        $("#ImageforUpload1").attr('src', 'images/add.png');
        $("#ans1").removeAttr('disabled');
    });
    $("#imagedelete2").click(function (e) {
        isDirty = true;
        validateQuestions();
        e.preventDefault();
        $("#imagesize2").addClass("hidesize");
        $("#imagedelete2").addClass("hidedelete");
        $("#ImageforUpload2").attr('src', 'images/add.png');
        $("#ans2").removeAttr('disabled');
    });
    $("#imagedelete3").click(function (e) {
        isDirty = true;
        validateQuestions();
        e.preventDefault();
        $("#imagesize3").addClass("hidesize");
        $("#imagedelete3").addClass("hidedelete");
        $("#ImageforUpload3").attr('src', 'images/add.png');
        $("#ans3").removeAttr('disabled');
    });
    $("#imagedelete4").click(function (e) {
        isDirty = true;
        validateQuestions();
        e.preventDefault();
        $("#imagesize4").addClass("hidesize");
        $("#imagedelete4").addClass("hidedelete");
        $("#ImageforUpload4").attr('src', 'images/add.png');
        $("#ans4").removeAttr('disabled');
    });
    $("#imagedelete5").click(function (e) {
        isDirty = true;
        validateQuestions();
        e.preventDefault();
        $("#imagesize5").addClass("hidesize");
        $("#imagedelete5").addClass("hidedelete");
        $("#ImageforUpload5").attr('src', 'images/add.png');
        $("#ans5").removeAttr('disabled');
    });
    $("#imagedelete6").click(function (e) {
        isDirty = true;
        validateQuestions();
        e.preventDefault();
        $("#imagesize6").addClass("hidesize");
        $("#imagedelete6").addClass("hidedelete");
        $("#ImageforUpload6").attr('src', 'images/add.png');
        $("#ans6").removeAttr('disabled');
    });
    $("#queImagedelete").click(function (e) {
        isDirty = true;
        validateQuestions();
        e.preventDefault();
        $("#queImagesize").addClass("hidesize");
        $("#queImagedelete").addClass("hidedelete");
        $("#queImagebtn").attr('src', 'images/add.png');
    });

    $("#addNameTB").on('input', function () {
        if ($("#addNameTB").val().length == 0) {
            $("#createGame").parent().addClass("button-blocked");
            $("#createGame").attr('disabled', 'disabled');
        } else {
            $("#createGame").parent().removeClass("button-blocked");
            $("#createGame")[0].removeAttribute('disabled');
        }

    });

    $("#questionTextBox").on('input', function () {
        isDirty = true;
        validateQuestions();
    });

    onRadioChange();

    $("#cleanInputing").attr('disabled', 'true');
    $("#saveQuestion").attr('disabled', 'true');
    $("#createGame").attr('disabled', 'true');

    var numOfQuestions = $("#GridView1 tr").length - 1;

    if (numOfQuestions >= 15) {
        $("#cleanInputing").parent().addClass("button-blocked");
        $("#cleanInputing").attr('disabled', 'true');
        $("#saveQuestion").parent().addClass("button-blocked");
        $("#saveQuestion").attr('disabled', 'true');
    }
 


    if (numOfQuestions >= 15) {
        answerInput.attr('disabled', 'true');
        imageUpload.attr('disabled', 'true');
        $("#questionTextBox").attr('disabled', 'true');
        $("#queImagebtn").attr('disabled', 'true');
    }
})




