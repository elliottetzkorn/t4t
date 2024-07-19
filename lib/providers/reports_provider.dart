import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:t4t/data/report_data.dart';
import 'package:t4t/repositories/reports_repository.dart';
part 'reports_provider.g.dart';

@riverpod
class Reports extends _$Reports {
  @override
  Future<List<ReportData>> build() async {
    final reports = await ReportsRepository.reports();

    return reports.map((e) => ReportData.fromJson(e)).toList();
  }

  Future<void> banUser(String pid) async {
    await Supabase.instance.client.rpc('ban_user', params: {'pid': pid});

    await future.then((value) {
      value.removeAt(0);
      state = AsyncData(value);
    });
  }

  Future<void> pardonUser(String pid) async {
    await Supabase.instance.client.rpc('pardon_user', params: {'pid': pid});

    await future.then((value) {
      value.removeAt(0);
      state = AsyncData(value);
    });
  }
}
