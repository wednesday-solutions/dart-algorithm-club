import 'package:dart_algorithm_club/data-structures/graph/adjacency-list-graph.dart';
import 'package:dart_algorithm_club/data-structures/graph/adjacency-matrix-graph.dart';
import 'package:test/test.dart';

void main() {
  AdjacencyMatrixGraph adjacencyMatrixGraph;
  AdjacencyListGraph adjacencyListGraph;

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
      graph.addDirectedEdge(v2, v3, 1);
      graph.addDirectedEdge(v3, v4, 4.5);
      graph.addDirectedEdge(v4, v1, 2.8);
      graph.addDirectedEdge(v2, v5, 3.2);
    }
  });

  group('Tests for the Graph data structure', () {
    test('it should create the graph correctly with the weight between each node', () {
      expect(adjacencyMatrixGraph.toString(),
          ' ø  1  ø  ø  ø \n'
          ' ø  ø  1  ø  3.2 \n'
          ' ø  ø  ø  4.5  ø \n'
          ' 2.8  ø  ø  ø  ø \n'
          ' ø  ø  ø  ø  ø ');
      expect(adjacencyListGraph.toString(),
          '1 -> [2: 1]\n'
          '2 -> [3: 1, 5: 3.2]\n'
          '3 -> [4: 4.5]\n'
          '4 -> [1: 2.8]');
    });
  });
}
