def minDistance(shortestPath,distance)
  minDistance=18446744073709551616 # max number
  i=0
  while i<9
  if shortestPath[i]==false and distance[i]<=minDistance
    minDistance=distance[i]
    min=i
  end
  i+=1
end
return min
end

def dijkstra (graph,picked,v)
shortestPath= Array.new
distance=Array.new
for index in 0..(v-1)
  shortestPath[index]=false
  distance[index]=18446744073709551616
  #puts (shortestPath[index].to_s+"-"+distance[index].to_s)
end
distance[0]=0
i=0
while i<(v-1)
  minIdx=minDistance(shortestPath,distance)
  shortestPath[minIdx]=true

  for j in 0..(v-1)
    if graph[minIdx][j]!=0 and distance[minIdx]!=18446744073709551616 
      if distance[minIdx]+graph[minIdx][j]<distance[j] and shortestPath[j]==false
      distance[j]=distance[minIdx]+graph[minIdx][j]
      end
    end
  end
  i+=1
end
puts "Vertex\t\t\tDistance"
for index in 0..(v-1)
  puts (index.to_s+"\t\t\t"+distance[index].to_s)
end
end

adjacentVertice = [ [ 0,4,0,0,0,0,0,8,0,0],
          [ 8,0,7,0,0,0,0,0,0,0 ],
          [0,7,0,1,6,0,0,0,0,0],
          [ 0,0,1,0,5,0,0,11,0,0],
          [ 0,0,6,5,0,2,0,0,0,0],
          [0,0,0,0,2,0,3,0,0,6],
          [0,0,0,0,0,3,0,0,9,0],
          [8,0,0,11,0,0,0,0,10,0],
          [0,0,0,0,0,0,9,10,0,7 ]]
puts "Source Vertex: 0"
dijkstra(adjacentVertice,0,9)
