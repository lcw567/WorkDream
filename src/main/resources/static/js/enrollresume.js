function displayEducationFields() {
    const selectedEducation = document.getElementById("selectedu").value;

    document.getElementById("elementaryFields").style.display = "none";
    document.getElementById("middleSchoolFields").style.display = "none";
    document.getElementById("highSchoolFields").style.display = "none";
    document.getElementById("collegeFields").style.display = "none";
    document.getElementById("graduateFields").style.display = "none";

    if (selectedEducation === "element") {
        document.getElementById("elementaryFields").style.display = "block";
    } else if (selectedEducation === "middle") {
        document.getElementById("middleSchoolFields").style.display = "block";
    } else if (selectedEducation === "high") {
        document.getElementById("highSchoolFields").style.display = "block";
    } else if (selectedEducation === "college") {
        document.getElementById("collegeFields").style.display = "block";
    } else if (selectedEducation === "graduate") {
        document.getElementById("graduateFields").style.display = "block";
    }
}
