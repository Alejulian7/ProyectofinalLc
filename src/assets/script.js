//BUSCADOR INTERNO//

//ejecutando funciones//
document.getElementById("inputSearch").addEventListener("click", mostrar_caja_busquedas)

//declarando variables//
ctn_bars_search = document.getElementById("ctn-bars-search");
inputSearch = document.getElementById("inputSearch");
box_search = document.getElementById("box-search");

//funcion para mostrar la caja de busqueda//
function mostrar_caja_busquedas(){
    box_search.style.display = "block";
    inputSearch.focus();
}

//Ejecutando Funciones//
document.getElementById("inputSearch").addEventListener("keyup", buscador_interno)
//filtrado de busqueda//
function buscador_interno(){
    filter = inputSearch.value.toUpperCase();
    li = box_search.getElementByTagName("li");

//reecorriendo elementos a filtrar mediante los li//
    for( i = 0; i < li.length; i++)

    a = li[i].getElementByTagName("a")[0];
    textvalue = a.textContent || a.innerText;

    if(textValue.toUpperCase().indexOf(filter) > -1){
        li[i].style.display = "";
        box_search.style.display = "block";

        if(inputSearch.value === ""){
            box_search.style.display = "none";
        }
    }
    else{
        li[i].style.display = "none";
    }

    
}