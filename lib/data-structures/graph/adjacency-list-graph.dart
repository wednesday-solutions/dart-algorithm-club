

import 'dart:collection';

import 'package:dart_algorithm_club/data-structures/graph/edge-list.dart';
import 'package:dart_algorithm_club/data-structures/graph/edge.dart';
import 'package:dart_algorithm_club/data-structures/graph/graph.dart';
import 'package:dart_algorithm_club/data-structures/graph/vertex.dart';

class AdjacencyListGraph<T> extends Graph {

  var adjacencyList;

  AdjacencyListGraph() {
    adjacencyList = <EdgeList<T>>[];
  }

  @override
  List<Edge> get edges {
    var edges = <Edge<T>>{};
    adjacencyList.forEach((EdgeList edgeList) {
      edges.addAll(edgeList.edges);
    });
    return edges.toList();
  }

  @override
  List<Vertex> get vertices {
    var vertices = <Vertex>[];
    adjacencyList.forEach((EdgeList edgeList) {
      vertices.add(edgeList.vertex);
    });
    return vertices;
  }

  @override
  HashMap<Vertex, num> get indegrees {
    var hashMap = HashMap<Vertex, num>();
    for (var edgeList in adjacencyList) {
      hashMap[edgeList.vertex] = 0;
    }

    for (var edgeList in adjacencyList) {
      for (var edge in edgeList.edges) {
        hashMap[edge.to] += 1;
      }
    }
    return hashMap;
  }

  @override
  List<Vertex> get topologicalSort {
    List<Vertex> depthFirstSearch(Vertex startNode, HashMap<Vertex, bool> visited) {
      var result = <Vertex>[];
      visited[startNode] = true;
      for (var edge in edgesFrom(startNode)) {
        if (edge != null && !visited[edge.to]) {
          result = depthFirstSearch(edge.to, visited) + result;
        }
      }

      return [startNode] + result;
    }
    var startVertices = indegrees;
    startVertices.removeWhere((key, value) => value != 0);
    var startNodes = startVertices.keys;
    var visited = HashMap<Vertex, bool>();
    for (var edgeList in adjacencyList) {
      visited[edgeList.vertex] = false;
    }

    var result = <Vertex>[];
    for (var startNode in startNodes) {
      result = depthFirstSearch(startNode, visited) + result;
    }
    return result;
  }

  @override
  Vertex createVertex(data) {
    var matchingVertex = vertices.lastWhere((vertex) => vertex.data == data, orElse: () => null);

    if (matchingVertex == null) {
      matchingVertex = Vertex(data, adjacencyList.length);
      adjacencyList.add(EdgeList(matchingVertex));
    }
    return matchingVertex;
  }

  @override
  void addDirectedEdge(Vertex from, Vertex to, [num weight]) {
    var edge = Edge(from, to, weight);
    var edges = adjacencyList[from.index].edges;
    edges.add(edge);
  }

  @override
  void addUnDirectedEdge(Vertex from, Vertex to, [num weight]) {
    addDirectedEdge(from, to, weight);
    addDirectedEdge(to, from, weight);
  }

  @override
  num weightFrom(Vertex sourceVertex, Vertex destinationVertex) {
    var edges = adjacencyList[sourceVertex.index].edges;
    var matchingEdge;
    for(Edge edge in edges) {
      if (edge.to == destinationVertex) {
        matchingEdge = edge;
        break;
      }
    }
    return matchingEdge ? matchingEdge.weight : null;

  }

  @override
  List<Edge<T>> edgesFrom(Vertex sourceVertex) {
    var edgeList = adjacencyList[sourceVertex.index];
    if (edgeList != null) {
      return edgeList.edges;
    }
    return null;
  }

  @override
  String toString() {
    var rows = <String>[];
    for (var edgeList in adjacencyList) {
      if (edgeList.edges.length == 0) {
        continue;
      }

      var row = <String>[];
      for(var edge in edgeList.edges) {
        row.add('${edge.to.data}: ${edge.weight}');
      }
      rows.add('${edgeList.vertex.data} -> [${row.join(', ')}]');
    }
    return rows.join('\n');
  }
}
