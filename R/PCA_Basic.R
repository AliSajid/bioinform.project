PCA_Basic <- function(Data){
  library(ggplot2)

  pca <- prcomp(t(Data), scale=TRUE)

  ## plot pc1 and pc2
  plot(pca$x[,1], pca$x[,2])

  ## make a scree plot
  pca.var <- pca$sdev^2
  pca.var.per <- round(pca.var/sum(pca.var)*100, 1)

  barplot(pca.var.per, main="Scree Plot", xlab="Principal Component", ylab="Percent Variation")

  ## now make a fancy looking plot that shows the PCs and the variation:
  pca.data <- data.frame(Sample=rownames(pca$x),
                         X=pca$x[,1],
                         Y=pca$x[,2])
  pca.data

  p <- ggplot(data=pca.data, aes(x=X, y=Y, label=Sample)) +
    geom_text() +
    xlab(paste("PC1 - ", pca.var.per[1], "%", sep="")) +
    ylab(paste("PC2 - ", pca.var.per[2], "%", sep="")) +
    theme_bw()

  print(p)
  }
