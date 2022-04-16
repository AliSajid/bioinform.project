RNA_EdgeR <- function(data_raw, group){

  dim(data_raw)
  head(data_raw)
  tail(data_raw)

  data_raw=data_raw[!duplicated(data_raw[,1]),]
  row.names(data_raw) = data_raw[,1]
  data1 = data_raw[,-1]

  means <- rowMeans(data1)
  filter <- means >= 10
  table(filter)
  data1 <- data1[filter,]
  dim(data1)


  colors <- brewer.pal(9, "Set1")
  totCounts <- colSums(data1)
  barplot(totCounts, las=2, col="blue")

  boxplot(log2(data1+1), las=2, col="green")

  #group <- c(rep("SG",3), rep("MG",3))
  counts <- data1
  cds <- DGEList( counts , group = group )
  names(cds)

  head(cds$counts) # original count matrix
  cds$samples # contains a summary of your samples
  sum(cds$all.zeros) # How many genes have 0 counts across all samples

  cds <- calcNormFactors(cds, method="upperquartile")
  cds$samples

  scale <- cds$samples$lib.size*cds$samples$norm.factors
  normCounts <- round(t(t(counts)/scale)*mean(scale))
  boxplot(log2(normCounts+1), las=2, col=colors[cds$samples$group])

  cds <- estimateCommonDisp(cds, verbose=TRUE)

  cds <- estimateTagwiseDisp(cds)

  plotBCV(cds)

  meanVarPlot <- plotMeanVar(cds, show.raw.vars=TRUE, show.tagwise.vars=TRUE, show.binned.common.disp.vars=FALSE, show.ave.raw.vars=FALSE, NBline = TRUE,
                             nbins = 100 , pch = 16 , xlab ="Mean Expression (Log10 Scale)" , ylab =
                               "Variance (Log10 Scale)", main = "Mean-Variance Plot" )

  design <- model.matrix(~group)
  design

  fit <- glmFit(cds, design)
  lrt <- glmLRT(fit)

  top <- topTags(lrt, n=nrow(cds$counts))$table
  head(top)

  de <- rownames(top[top$FDR<0.05,])
  length(de)
  head(de)
  hist(top$PValue, breaks=20)

  #plot a heatmap of the top genes.
  heatmap(log(normCounts[de[1:10],]+1), ColSideColor=colors[group])

  #Outputting the results
  write.csv(top, file="results2.csv")
}
