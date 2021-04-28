import 'dart:collection';

import 'package:dart_algorithm_club/data-structures/graph/adjacency-list-graph.dart';
import 'package:dart_algorithm_club/data-structures/graph/adjacency-matrix-graph.dart';
import 'package:dart_algorithm_club/data-structures/graph/vertex.dart';
import 'package:test/test.dart';

void main() {
  AdjacencyMatrixGraph adjacencyMatrixGraph;
  AdjacencyListGraph adjacencyListGraph;
  var result = <Vertex>[];

  setUp(() {
    adjacencyMatrixGraph = AdjacencyMatrixGraph();
    adjacencyListGraph = AdjacencyListGraph();
    final graphs = [adjacencyMatrixGraph, adjacencyListGraph];

    for (var graph in graphs) {
      final v1 = graph.createVertex(1);
      final v2 = graph.createVertex(2);
      final v3 = graph.createVertex(3);
      final v4 = graph.createVertex(4);
      final v5 = graph.createVertex(5);

      graph.addDirectedEdge(v1, v2, 1);
      graph.addDirectedEdge(v1, v3, 1);
      graph.addDirectedEdge(v2, v4, 1);
      graph.addDirectedEdge(v3, v4, 1);
      graph.addDirectedEdge(v4, v5, 1);

      if (result.isEmpty) {
        result.add(v1);
        result.add(v3);
        result.add(v2);
        result.add(v4);
        result.add(v5);
      }
    }
  });

  group('Tests for topological sort', () {
    test('it should sort the graph correctly', () {
      expect(adjacencyMatrixGraph.topologicalSort, result);
      expect(adjacencyListGraph.topologicalSort, result);
    });
  });
}
