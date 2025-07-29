floracao = as.data.frame(bianca_so_floracao_2025)
row.names(floracao) = floracao$`Nome comum`
matrizflor = floracao[, -c(1,2)]
# Assuming you have a data frame called 'data' with your community data
# and have already calculated the Bray-Curtis dissimilarity matrix (bc_dist)

# Calculate Bray-Curtis dissimilarity
library(vegan)
bc_dist <- vegdist(matrizflor, method = "bray")

# Perform hierarchical clustering with Ward's method
hc <- hclust(bc_dist, method = "ward.D2")

# Plot the dendrogram
plot(hc, main = "Dendrogram of Cluster Analysis (Bray-Curtis, Ward)",
     xlab = "Samples", ylab = "Distance")

# Cut the dendrogram to define clusters (e.g., at a height of 0.7)
clusters <- cutree(hc, h = 0.7)

# You can now use the 'clusters' vector to assign each sample to a cluster.

# Optionally, you can visualize the clusters on a scatter plot (if you have 2D data)
# or other appropriate visualizations depending on your data.