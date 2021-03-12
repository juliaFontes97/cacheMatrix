---
title: "Tarefa Cousera"
author: 'Júlia Fontes'
date: "12/03/2021"
output: html_document
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```


```{r}
# Função 1:

makeCacheMatrix <- function(x=matrix()){
  inversa <- NULL
  set <- function(y){
    x<<-y
    inversa <<- NULL
  }
  get <- function() x
  setInverse <- function(inverse) inversa <<- inverse
  getInverse <- function() inversa
  list(set = set, 
       get = get, 
       setInverse = setInverse, 
       getInverse = getInverse)
}
  
# Função 2:
  
cacheSolve <- function(x, ...){
  inversa <- x$getInverse()
  if(!is.null(inversa)){
    message("Dados em cache!")
    return(inversa)
  }
  matriz <- x$get()
  inversa <- solve(matriz, ...)
  x$setInverse(inversa)
  inversa
}

# Testando as funções criadas:

source("cachematrix.rmd")
minhaMatriz <- makeCacheMatrix(matrix(1:4, 2, 2))
minhaMatriz$get()

minhaMatriz$getInverse()

cacheSolve(minhaMatriz)

```

