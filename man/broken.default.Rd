% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/break.R
\name{broken.default}
\alias{broken.default}
\title{Create the model agnostic broken object}
\usage{
\method{broken}{default}(model, new_observation, data, direction = "up", ...,
  baseline = 0, predict.function = predict)
}
\arguments{
\item{model}{a ranger model}

\item{new_observation}{a new observation with columns that corresponds to variables used in the model}

\item{data}{the original data used for model fitting, should have same collumns as the 'new_observation'.}

\item{direction}{either 'up' or 'down' determined the exploration strategy}

\item{...}{other parameters}

\item{baseline}{the orgin/baseline for the breakDown plots, where the rectangles start. It may be a number or a character "Intercept". In the latter case the orgin will be set to model intercept.}

\item{predict.function}{function that will calculate predictions out of model. It shall return a single numeric value per observation. For classification it may be a probability of the default class.}
}
\value{
an object of the broken class
}
\description{
Create the model agnostic broken object
}
\examples{
library(breakDown)
library(randomForest)
library(ggplot2)
set.seed(1313)
model <- randomForest(factor(left)~., data = HR_data, family = "binomial", maxnodes = 5)
predict.function <- function(model, new_observation)
      predict(model, new_observation, type="prob")[,2]
predict.function(model, HR_data[11,-7])
explain_1 <- broken(model, HR_data[11,-7], data = HR_data[,-7],
predict.function = predict.function, direction = "down")
explain_1
plot(explain_1) + ggtitle("breakDown plot (direction=down) for randomForest model")

}
